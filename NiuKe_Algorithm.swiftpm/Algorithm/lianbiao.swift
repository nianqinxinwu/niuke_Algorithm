//
//  lianbiao.swift
//  NiuKe_Algorithm
//
//  Created by 舞极灵瞳 on 2024/12/18.
//


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int = 0, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

public class Solution {
    /**
     *
     * 反转链表 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param head ListNode类
     * @return ListNode类
     */
    func ReverseList ( _ head: ListNode?) -> ListNode? {
        // write code here
        // 头插法
        let preNode: ListNode? = nil
        var pNode: ListNode? = head
        while pNode != nil {
            // 获取下一个结点
            let nextNode: ListNode? = pNode?.next
            // 反转1
            pNode?.next = preNode
            preNode?.next = pNode
            // 反转2
            pNode = nextNode
        }
        return preNode
    }
}
