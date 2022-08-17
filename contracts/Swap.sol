// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

interface IERC20 {
    event Transfer(address indexed from, address indexed to, uint256 value);
 
    event Approval(address indexed owner, address indexed spender, uint256 value);

    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function transfer(address to, uint256 amount) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

contract Swap is ERC20 {

    uint ID = 1;

    struct SwapRequest {
        address from;
        // address to;
        uint tokenAmountToSwap;
        // uint tokenAmountNeeded;
        address tokenAddressToSwap;
        address tokenAddressNeeded;
        bool claimed;
    }

    // txId to the user's details
    mapping(uint => SwapRequest) swapRequestRecord;

    constructor() {

    }

    function createSwapRequest(address _tokenAddress, uint _amount) external {
        require(_msgSender() != address(0), "Address zero cannot create a swap request");

        SwapRequest storage swr = swapRequestRecord[ID];

        swr.from = _msgSender();
        swr.tokenAmountToSwap += _amount;
        // swr.

        bool transfer_status = IERC20(_tokenAddress).transferFrom(msg.sender, address(this), _amount); // this is the line that is failing
        require(transfer_status, "Transfer failed");

        // swapRequestRecord[msg.sender][_tokenAddress] += _amount;

        // emit _deposit_erc20(_tokenAddress,msg.sender,_amount);

        ID++;
    }


    function approveSwapRequest(uint _id, uint amount, address _tokenAddress) external {
        SwapRequest storage swr = swapRequestRecord[_id];

        address _to = swr.from;

        require(userBalance >= _amount, "Insufficient fund");

        bool transfer_status = IERC20(_tokenAddress)._transfer(_msgSender(), _to, amount);

        require(transfer_status, "Transfer failed");
        
        bool transfer_status = IERC20(_tokenAddress).transfer(_to, swr.tokenAmountToSwap);

        require(transfer_status, "Withdraw Error");


    //    emit _transfer_erc20(_tokenAddress, msg.sender, _to, _amount); 
    }
}   