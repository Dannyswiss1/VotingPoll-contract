//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "../VotingPoll.sol";

interface IVotingPollFactory {

    function createVotingPoll() external returns (VotingPoll newVotingPoll_, uint256 length_);

    function getVotingPolls() external  view returns (VotingPoll[] memory);
}