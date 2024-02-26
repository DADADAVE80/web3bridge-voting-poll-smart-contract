// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Voting {
    mapping(address => mapping(address => uint256)) candidateVotes;
    address[] candidates;
    uint256 duration;

    function addCandidate(address _candidate) external {
        candidates.push(_candidate);
    }

    function showCandidates() external view returns (address[] memory) {
        return candidates;
    }

    function castVote(address _candidate) external {
        for (uint i = 0; i < candidates.length; i++) {
            if (candidates[i] == _candidate) {
                if (candidateVotes[msg.sender][_candidate] == 0) {
                    candidateVotes[msg.sender][_candidate] += 1;
                } else {
                    revert("You have already voted for this candidate");
                }
            }
        }
    }
}
