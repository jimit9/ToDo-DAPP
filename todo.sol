// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract todo {
    struct taskItem {
        string task;
        bool isExecuted;
    }
    mapping(uint256 => taskItem) public tasks;
    uint256 public count;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "You van not call this function");
        _;
    }

    function addTask(string calldata task) public onlyOwner {
        taskItem memory item = taskItem({task: task, isExecuted: false});
        tasks[count] = item;
    }

    function completedTask(uint id) public onlyOwner {
        require(tasks[id].isExecuted == false, "task already done");
        tasks[id].isExecuted = true;
    }
}
