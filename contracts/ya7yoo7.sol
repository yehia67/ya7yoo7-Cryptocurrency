pragma solidity ^0.5.0;

contract ya7yoo7{
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    string public name = "ya7yoo7";
    string public symbole = "YTA";
    string public standard = "ya7yoo7 v1.0";
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    mapping (address => mapping (address => uint256)) private _allowed;
    constructor (uint256 _totalSupply) public {
        balanceOf[msg.sender] = _totalSupply;
        totalSupply = _totalSupply;
    }
    
   

    function transfer(address _to, uint256 _value) public returns (bool success){
        if (_value <= balanceOf[msg.sender]) {
            balanceOf[msg.sender] -= _value;
            balanceOf[_to] += _value;
            emit Transfer(msg.sender,_to,_value);
            return true;

        } else {
            return false;
        }
    }
    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
            require(_value <= balanceOf[_from]);
            require(_value <= _allowed[msg.sender][_from]);
            require(_to != address(0));

            balanceOf[_from] = balanceOf[_from]-_value;
            balanceOf[_to] = balanceOf[_to]+_value;
            _allowed[_from][msg.sender] = _allowed[_from][msg.sender] -  _value;
            emit Transfer(_from, _to, _value);
            return true;
        }
    function approve(address spender, uint256 _value) public returns (bool) {
        require(spender != address(0));

        _allowed[msg.sender][spender] = _value;
        emit Approval(msg.sender, spender, _value);
        return true;
  }


}
