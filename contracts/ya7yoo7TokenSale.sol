pragma solidity ^0.5.0;
import './ya7yoo7.sol';
contract ya7yoo7TokenSale{
address admin;
ya7yoo7 public tokenContract;
uint256 public tokenPrice;
constructor (ya7yoo7 _tokenContract,uint256 _tokenPrice) public {
    admin = msg.sender;
    tokenContract = _tokenContract;
    tokenPrice = _tokenPrice;
}


}
