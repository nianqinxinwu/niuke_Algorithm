//
//  DongTai.swift
//  NiuKe_Algorithm
//
//  Created by 舞极灵瞳 on 2024/12/18.
//

public class SolutionDongTai {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param A string字符串
     * @return int整型
     */
    func getLongestPalindrome ( _ A: String) -> Int {
// write code here
        guard A.count > 1 else { return A.count }
        // 将字符串变成字符数组
        let chars = Array(A)
        var maxLength = 0
        
        for i in 0..<chars.count {
            // 检查奇长
            var l = i
            var r = i
            
            while l >= 0 && r < chars.count && chars[l] == chars[r] {
                maxLength = max(maxLength, r - l + 1)
                
                l -= 1
                r += 1
            }
            
            // 检查等长
            l = i
            r = i + 1
            while l >= 0 && r < chars.count && chars[l] == chars[r] {
                maxLength = max(maxLength, r - l + 1)
                l -= 1
                r += 1
            }
        }
        
        return maxLength
    }
    
//    func getLongestPalindromeMancher ( _ s: String) -> Int {
//        guard s.count > 1 else { return s.count }
//        
//        // 预处理字符串以避免偶数/奇数长度问题
//        let T = "#" + s.map{ String($0) }.joined(separator: "#") + "#"
//        let chars = Array(T)
//        let n = chars.count
//        var resultArray = [Int](repeating: 0, count: n)
//        
//        var current = 0
//        var R = 0
//        for i in 0..<n {
//            var mirr = 2 * current - i
//            
//            if i < R {
//                resultArray[i] = min(R - i, resultArray[mirr])
//            }
//            
//            while i + resultArray[i] + 1 <
//        }
//        
//        return resultArray.max()! / 2
//    }
    // 长度为K的无重复子串数量
    func numKLenSubstrNoRepeats(_ s: String, _ k: Int) -> Int {
            var count: Int
            count = 0
            var windowStr = String()
            for char in s {
                if windowStr.count < k {
                    while windowStr.contains(char) {
                        windowStr.remove(at: windowStr.startIndex)
                    }
                    windowStr.append(char)
                } else {
                    windowStr.remove(at: windowStr.startIndex)
                    while windowStr.contains(char) {
                        windowStr.remove(at: windowStr.startIndex)
                    }
                    windowStr.append(char)
                }

                if windowStr.count == k {
                    count += 1
                    print(windowStr+"\n")
                }
            }
            return count
        }
    
    /*
     给你一个 非空 整数数组 nums ，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

     你必须设计并实现线性时间复杂度的算法来解决此问题，且该算法只使用常量额外空间。
     
     成对的元素异或之后会得到0，而只出现一次的元素与0异或仍然是其本身。因此，最终的结果就是那个只出现一次的元素。

     */
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            result ^= num
        }
        return result
    }
    
    /*
     多元素
     */
    func majorityElement(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return -1 }
        
        var temp = nums.sorted()
        return temp[temp.count / 2]
    }
    
    /*
     爬楼梯
     假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

     每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
     */
    
    func climbStairs(_ n: Int) -> Int {
        if n <= 3 {
            return n
        }
        
        var f2 = 2
        var f3 = 3
        
        for n in 4...n {
            let f4 = f2 + f3
            f2 = f3
            f3 = f4
        }
        return f3
    }
    
    /*
     给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。

     你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。

     返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。
     */
    
    func maxProfit(_ prices: [Int]) -> Int {
            var res = 0
            var temp = Int.max
            for i in 0..<prices.count {
                // 寻找买入点
                temp = min(temp, prices[i])
                // 寻找最大利润值
                res = max(res,prices[i] - temp)
            }
            return res
        }
    
    /*
     数组中第K大的元素
     */
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let temp = nums.sorted()
        return temp [nums.count - k]
    }
    
    var quickNums:[Int]!
    func randomPartition(_ left: Int, _ right: Int) -> Int {
        if left >= right {
            return left
        }
        
        let x = quickNums[right]
        
        var i = left
        for j in left..<right {
            if quickNums[j] < x {
                quickNums.swapAt(i, j)
                i += 1
            }
        }
        //! 最后 将 参考值 替换
        quickNums.swapAt(i, right)
        return i
    }
    
    func quickSelect(_ left: Int, _ right:Int, _ index:Int) -> Int {
      //! 找到分区点
      let q = randomPartition(left,right)
      if q == index {
        return quickNums[q]
      } else {
        return q < index ? quickSelect(q+1, right, index) : quickSelect(left, q-1, index)
      }

    }
    
    func findKthLargestQuick(_ nums: [Int], _ k: Int) -> Int {
        self.quickNums = nums
        let res = quickSelect(0, nums.count - 1, nums.count - k)
        return res
    }
    
    /*
     给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

     有效字符串需满足：

     左括号必须用相同类型的右括号闭合。
     左括号必须以正确的顺序闭合。
     每个右括号都有一个对应的相同类型的左括号。
     */
    func isValid(_ s: String) -> Bool {
        var stack = [String.Element]()
        for ch in s {
            if ch == "(" {
                stack.append(")")
            } else if ch == "{" {
                stack.append("}")
            } else if ch == "[" {
                stack.append("]")
            } else {
                let top = stack.last
                if ch == top {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}
