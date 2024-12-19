//
//  erfenchazhao.swift
//  NiuKe_Algorithm
//
//  Created by 舞极灵瞳 on 2024/12/18.
//

public class SolutionErFen {
    /**
     *二分查找
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param nums int整型一维数组
     * @param target int整型
     * @return int整型
     */
    func search ( _ nums: [Int],  _ target: Int) -> Int {
// write code here
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            // 取居中
            let mid = left + (right - left) / 2
            
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return -1
    }
    
    
    /// 寻找最小值
    /// - Parameter nums: <#nums description#>
    /// - Returns: <#description#>
    func findMin(_ nums: [Int]) -> Int {
        // 特殊情况
        if nums.isEmpty {
            return 0
        }
        
        // 左右指针 left 和 right
        var left = 0
        var right = nums.count - 1
        
        // 循环
        while left < right {
            // 找到数组的中点 m
            let mid = (left + right) / 2
            
            if nums[mid] > nums[right] {
                left = mid + 1
            } else if nums[mid] < nums[right] {
                // mid 在右排序数组中，旋点在[left,mid] 中
                right = mid
            } else {
                // 缩小范围
                right -= 1
            }
        }
        return nums[left]
    }
}
