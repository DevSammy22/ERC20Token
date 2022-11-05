// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address public admin;

    constructor() ERC20("MY Token", "MTN") {
        _mint(msg.sender, 50000 * 10**18); //function in OpenZeppelin. This would work as you can distribute your token
        admin = msg.sender;
    }

    //For non-fixed supply
    function mint(address accountTo, uint amount) external {
        require(msg.sender == admin, "Only admin can send fund");
        _mint(accountTo, amount);
    }

    function burn(uint amount) external {
        _burn(msg.sender, amount);
    }
}
