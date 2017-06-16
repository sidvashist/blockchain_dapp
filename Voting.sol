pragma solidity ^0.4.6;

contract Voting{

	mapping (bytes32 => uint8) public candidateVotes;
	bytes32[] public candidateList;

	function Voting(bytes32[] candidateNames) {
		candidateList = candidateNames;
	}

	function totalVotesFor(bytes32 candidate) returns (uint8) {
		if (validCandidate(candidate) == false) throw;
		return candidateVotes[candidate];
	}

	function voteForCandidate(bytes32 candidate) {
		if (validCandidate(candidate) == false) throw;
		candidateVotes[candidate] += 1;
	}

	function validCandidate(bytes32 candidate) returns (bool) {
		for (uint i = 0; i < candidateList.length; i++){
			if(candidateList [i] == candidate) {
				return true;
			}
		}
		return false;
	}

}
