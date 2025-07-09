// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@zama/fhevm/abstracts/EIP712WithModifier.sol";
import "@zama/fhevm/contracts/FHE.sol";

contract MoodScore is EIP712WithModifier {
    mapping(address => euint8) private moodScores;

    constructor() {
        initializeEIP712("MoodScore");
    }

    function submitMood(
        euint8 q1,
        euint8 q2,
        euint8 q3,
        euint8 q4,
        euint8 q5
    ) public {
        euint8 total = q1 + q2 + q3 + q4 + q5;
        euint8 average = total / 5;
        moodScores[msg.sender] = average;
    }

    function getMoodScore() public view returns (euint8) {
        return moodScores[msg.sender];
    }
}
