// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Voting {
    struct Poll {
        mapping(address => uint) candidateVotes;
        address[] candidates;
        uint duration;
    }

    function createPoll(address[] _candidates, uint _duration) external {
        Poll poll = Poll(_candidates, _duration);
    }

    function castVote(address _candidate) external {
        candidateVotes[_candidate] = candidateVotes[_candidate] + 1;

    }
}