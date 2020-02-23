pragma solidity ^0.4.1;

pragma experimental ABIEncoderV2;

contract voting{
    
    enum State {active,inactive}
    
    /*event auctionOver(
        address addr,
        uint votes,
        bool succeeded
        );*/
    struct OptionPos {
        uint pos;
        bool exists;
    }
    uint[] public votes;
    string[] public options;
    mapping (address => bool) hasVoted;
    mapping (string => OptionPos) posOfOption;
    State public state;
    uint public deadline;
    
    constructor(string[] _options,uint duration) public {
        options=_options;
        votes.length = options.length;
        deadline = currentTime() + duration * 1 minutes;// time for auction
        state =State.active;
        
        for(uint i=0;i<options.length;i++){
            OptionPos memory optionPos = OptionPos(i,true);
            string optionName = options[i];
            posOfOption[optionName] = optionPos;
        }
        
    }
    
    function vote(uint option) public {
        require(0<=option && option<=options.length, "Invalid option");
        require(!hasVoted[msg.sender], "Account has already voted");
        
        votes[option] = votes[option] + 1;
        hasVoted[msg.sender] = true; 
        
        
    }
    
    function vote(string optionName) public{
        require(!hasVoted[msg.sender], "Account has already voted");
        
        OptionPos memory optionPos = posOfOption[optionName];
        require(optionPos.exists,"It does not exists");
        
        votes[optionPos.pos]=votes[optionPos.pos]+1;
        hasVoted[msg.sender]=true;
        
        
    }
    
    function getoptions() public view returns (string[]) {
        return options;
    }
    
    function getVotes() public view returns(uint[]) {
        return votes;
    }
    function currentTime() internal view returns(uint){
        return now;
    }
}