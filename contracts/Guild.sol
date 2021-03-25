// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Guild {
    IERC20 public token;

    address public stakingContract;

    constructor(IERC20 _token, address _stakingContract) public {
        token = _token;
        stakingContract = _stakingContract;
    }

    function withdrawTo(address _recipient, uint256 _amount) external {
        require(msg.sender == stakingContract, "Guild.withdrawTo: Only staking contract");
        token.transfer(_recipient, _amount);
    }

    function tokenBalance() external returns (uint256) {
        return token.balanceOf(address(this));
    }
}
