//SPDX-License-Identifier: UNLICENSED

pragma solidity^ 0.8.17;

contract calculator {

    uint a;
    uint b;
    uint c;
    uint d;
    address admin;

    //setting admin through constructor while deploying
    constructor(){
        admin = msg.sender;
    }
    /*
           require
                       */
    //checking for admin 
    modifier isAdmin { 
        require (admin == msg.sender, "You are not the admin");
        _;
    }
    function user() public  view isAdmin returns(string memory){
        return("you are the admin");
    }
    /*
           assert
                       */
    //checking for successive equal numbers
    modifier isEqual {
        assert(a != b || b != c || c != d || d != a);
        _;
    }
    /*
           revert
                       */
    //checking for the order of values set 
    modifier inOrder { 
        if(!(a > b && (a-b) > c && (a-b-c) > d)){
            revert ("Values set should be in right order to subtract");
        }
        _;
    }

    //setting the values, only if less than 1000
    function set (uint _a, uint _b, uint _c, uint _d) public {
        a = _a;
        b = _b;
        c = _c;
        d = _d;
    }

    //addition only if isEqual
    function add() public view isEqual returns(uint){
        return(a+b+c+d);
    }

    //subtraction only if inOrder
    function sub() public view inOrder returns(uint){
        return(a-b-c-d);
    }

    //multiplication only if isAdmin
    function mul() public view isAdmin returns(uint){
        return(a*b*c*d);
    }
}