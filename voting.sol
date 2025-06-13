// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract VotingApp {
    string[] public candidates;
    mapping(string => bool) public isCandidate;
    mapping(address => bool) public hasVoted;
    mapping(string => uint) public noOfVotes;

    event Voted(address indexed voter, string candidate);

    constructor(string[] memory _candidates) {
        for (uint i = 0; i < _candidates.length; i++) {
            candidates.push(_candidates[i];
            isCandidate[_candidates[i]] = true;
        }
    }

    modifier onlyOnce() {
        require(!hasVoted[msg.sender], "You have already Voted");
        _;
    }

    function vote(string memory _candidate) public onlyOnce {
        require(isCandidate[_candidate], "Please vote a valid candidate");

        noOfVotes[_candidate]++;
        hasVoted[msg.sender] = true;

        emit Voted(msg.sender, _candidate);
    }

    function getVotes(string memory _candidate) public view returns (uint) {
        return noOfVotes[_candidate];
    }

    function findWinner() public view returns (string memory) {
        uint maxVotes = 0;
        uint winnerIndex = 0;

        for (uint i = 0; i < candidates.length; i++) {
            if (noOfVotes[candidates[i]] > maxVotes) {
                maxVotes = noOfVotes[candidates[i]];
                winnerIndex = i;
            }
        }

        return candidates[winnerIndex];
    }
}
