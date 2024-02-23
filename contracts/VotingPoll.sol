//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


contract VotingPoll {
    // Structure to store information about a voting option
    struct Option {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    // Structure to store information about a voting poll
    struct Poll {
        uint256 id;
        string title;
        Option[] options;
        mapping(address => bool) voted; // Track who voted on this poll
    }

    // Mapping to store polls by their ID
    mapping(uint256 => Poll) public polls;

    // Event emitted when a poll is created
    event PollCreated(uint256 id, string title);

    // Event emitted when a vote is cast
    event VoteCast(uint256 pollId, uint256 optionId, address voter);

    // Function to create a new voting poll
    function createPoll(string memory title, string[] memory optionNames) public {
        require(optionNames.length > 1, "Poll must have at least two options");

        uint256 pollId = block.number; // Use block number as a unique identifier

        Poll storage poll = polls[pollId];
        poll.id = pollId;
        poll.title = title;

        for (uint256 i = 0; i < optionNames.length; i++) {
            poll.options.push(Option(i, optionNames[i], 0));
        }

        emit PollCreated(pollId, title);
    }

    // Function to cast a vote on a poll
    function vote(uint256 pollId, uint256 optionId) public {
        require(polls[pollId].voted[msg.sender] == false, "Already voted on this poll");
        require(optionId < polls[pollId].options.length, "Invalid option ID");

        polls[pollId].voted[msg.sender] = true;
        polls[pollId].options[optionId].voteCount++;

        emit VoteCast(pollId, optionId, msg.sender);
    }

    // Function to get the results of a poll
    function getPollResults(uint256 pollId) public view returns (Option[] memory) {
        return polls[pollId].options;
    }
}
