// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract VotingApp {
    string[] public candidates;
    address[] voters;
    mapping(address => bool) hasVoted;
    mapping(string => uint) public noOfVotes;
    event Voted(address indexed voter, string candidate);


    constructor (string[] memory _candidates){
        candidates = _candidates;
    }

    function vote(string memory _candidate) public {
        require(!hasVoted[msg.sender],"You have already Voted");
        bool found = false;
        for (uint i = 0; i < candidates.length; i++) {
            if (
                keccak256(abi.encodePacked(candidates[i])) ==
                keccak256(abi.encodePacked(_candidate))
            ) {
                found = true;
                break;
            }
        }

        require(found, "Please vote a valid candidate");

        noOfVotes[_candidate]++;
        hasVoted[msg.sender] = true;
        voters.push(msg.sender);
        emit Voted(msg.sender,_candidate);
    }

    function getVotes(string memory _candidate) public view returns (uint) {
        return noOfVotes[_candidate];
    }

    function findWinner() public view returns (string memory) {
        int maxVote = -1;
        uint maxIndex;
        for (uint i = 0; i < candidates.length; i++) {
            uint currVote=noOfVotes[candidates[i]];
            if (maxVote < int(currVote)) {
                maxVote = int(currVote);
                maxIndex = i;
            }
        }
        return candidates[maxIndex];
    }
}
