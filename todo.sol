// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract todo {
    struct taskItem {
        string task;
        bool isExecuted;
    }
    mapping(uint256 => taskItem) public tasks;
    uint256 public count;

    function addTask(string calldata task) public {
        taskItem memory item = taskItem({task: task, isExecuted: false});
        tasks[count] = item;
    }
}
