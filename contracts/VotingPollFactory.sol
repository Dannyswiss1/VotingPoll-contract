//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./VotingPoll.sol";

contract votingPollFactory {

    // address owner;

    VotingPoll[] votingPolls;

    function createVotingPoll() external returns (VotingPoll newVotingPoll_, uint256 length_) {

        newVotingPoll_ = new VotingPoll();

        votingPolls.push(newVotingPoll_);

        length_ = votingPolls.length;
    }

    function getVotingPolls() external  view returns (VotingPoll[] memory) {
        return votingPolls;
    }

}