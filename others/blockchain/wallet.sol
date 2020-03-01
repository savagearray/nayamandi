pragma solidity ^0.4.1;

pragma experimental ABIEncoderV2;

contract wallet {
    uint minApv;
    
    address beni;
    address owner;
    
    mapping (address => bool) approvedBy;
    mapping (address => bool) isApprover;
    uint apvNum;
    
    constructor(
        address[] _approvers,
        uint _minApv,
        address _beni
    ) public payable{
        
        require(_minApv <= _approvers.length, "Required number of approvers should be less than no of approvers");
        
        minApv = _minApv;
        beni = _beni;
        owner = msg.sender;
        
        for(uint i = 0; i< _approvers.length; i++) {
            address approver = _approvers[i];
            isApprover[approver] = true;
        }
    }
    
    function approve() public {
        require (isApprover[msg.sender],"Not an approver");
        
        if(!approvedBy[msg.sender]){
            apvNum++;
            approvedBy[msg.sender] = true;
        }
        
        if(apvNum == minApv) {
            beni.send(address(this).balance);
            selfdestruct(owner);
            }
        
    }
    
    function reject() public {
        require(isApprover[msg.sender],"Not an approver");
        
        selfdestruct(owner);
    }
    
}
