// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployToken} from "../script/DeployToken.s.sol";
import {Token} from "../src/Token.sol";

contract TokenTest is Test {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    Token public token;
    DeployToken public deployer;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");
    address carol = makeAddr("carol");

    uint256 constant STARING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployToken();
        token = deployer.run();

        vm.prank(address(msg.sender));
        token.transfer(bob, STARING_BALANCE);
    }

    function testTotalSupply() public view {
        assertEq(token.totalSupply(), deployer.INITIAL_SUPPLY());
    }

    function testDeployerBalanceAfterSetup() public view {
        uint256 expectedBalance = deployer.INITIAL_SUPPLY() - STARING_BALANCE;
        assertEq(token.balanceOf(msg.sender), expectedBalance);
    }

    function testTransferBetweenUsers() public {
        uint256 transferAmount = 5 ether;

        vm.prank(bob);
        token.transfer(alice, transferAmount);

        assertEq(token.balanceOf(alice), transferAmount);
        assertEq(token.balanceOf(bob), STARING_BALANCE - transferAmount);
    }

    function testTransferFailsIfNotEnoughBalance() public {
        vm.prank(alice); // 0 Ether
        vm.expectRevert();
        token.transfer(bob, 1 ether);
    }

    function testBobBalance() public view {
        assertEq(STARING_BALANCE, token.balanceOf(bob)); // 100 Ether
    }

    function testAllowenceWorks() public {
        uint256 initialAllowance = 1000;
        uint256 transferAmount = 500;

        vm.prank(bob);
        token.approve(alice, initialAllowance);

        vm.prank(alice);
        token.transferFrom(bob, alice, transferAmount);

        assertEq(token.balanceOf(alice), transferAmount);
        assertEq(token.balanceOf(bob), STARING_BALANCE - transferAmount);
    }

    function testAllowanceOverwrite() public {
        vm.prank(bob);
        token.approve(alice, 100 ether);

        vm.prank(bob);
        token.approve(alice, 50 ether);

        assertEq(token.allowance(bob, alice), 50 ether);
    }

    function test_Reverts_WhenTransferExceedsAllowance() public {
        vm.prank(bob);
        token.approve(alice, 1 ether);

        vm.prank(alice);
        vm.expectRevert();
        token.transferFrom(bob, carol, 2 ether);
    }

    function testAllowanceDecreasedAfterTransferFrom() public {
        vm.prank(bob); // 100 ether
        token.approve(alice, 10 ether);

        vm.prank(alice);
        token.transferFrom(bob, carol, 5 ether);

        assertEq(token.allowance(bob, alice), 5 ether);
        assertEq(token.balanceOf(carol), 5 ether);
    }

    function testRevokeAllowance() public {
        vm.prank(bob);
        token.approve(alice, 50 ether);

        vm.prank(bob);
        token.approve(alice, 0 ether);

        assert(token.allowance(bob, alice) == 0);
    }

    function testTransferEmitsEvent() public {
        vm.expectEmit(true, true, false, true);
        emit Transfer(bob, alice, 5 ether);

        vm.prank(bob);
        token.transfer(alice, 5 ether);
    }

    function testApproveEmitsEvent() public {
        vm.expectEmit(true, true, false, true);
        emit Approval(bob, alice, 20 ether);

        vm.prank(bob);
        token.approve(alice, 20 ether);
    }
}
