pragma solidity ^0.5.0;
import './ya7yoo7.sol';
import './SafeMath.sol';
contract ya7yoo7TokenSale{
address payable admin;
ya7yoo7 public tokenContract;
uint256 public tokenPrice;
uint256 public tokenSold;

event Sell(address _buyer,uint256 _amount);

constructor (ya7yoo7 _tokenContract,uint256 _tokenPrice) public {
    admin = msg.sender;
    tokenContract = _tokenContract;
    tokenPrice = _tokenPrice;
}

  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

function buyTokens(uint256 _numberOfTokens)  public payable  {
    require(msg.value == mul(_numberOfTokens,tokenPrice));
    require(tokenContract.balanceOf(address(this)) >= _numberOfTokens);
    require(tokenContract.transfer(msg.sender,_numberOfTokens));
    tokenSold += _numberOfTokens;
    emit Sell(msg.sender,_numberOfTokens);
}
function endSale() public {
 require(msg.sender == admin) ;
 require(tokenContract.transfer(admin,tokenContract.balanceOf(address(this))));
 selfdestruct(admin); 
}

}
