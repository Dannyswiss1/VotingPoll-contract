//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; 

interface IVotingPoll {

      struct Option {
        uint256 id;
        string name;
        uint256 voteCount;
    }
    
    struct Poll {
        uint256 id;
        string title;
        Option[] options;
        mapping(address => bool) voted; // Track who voted on this poll
    }

    function createPoll(string memory title, string[] memory optionNames) external ;

    function vote(uint256 pollId, uint256 optionId) external ;

    function getPollResults(uint256 pollId) external  view returns (Option[] memory);
}