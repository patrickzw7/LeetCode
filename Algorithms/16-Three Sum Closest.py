class Solution(object):
    def threeSumClosest(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        nums.sort()

        result = sum(nums[:3])

        for i in range(len(nums) - 2):
            left = i + 1
            right = len(nums) - 1
            while left < right:
                temp_sum = nums[i] + nums[left] + nums[right]

                if temp_sum == target:
                    return temp_sum
                
                if abs(temp_sum - target) < abs(result - target):
                    result = temp_sum

                if temp_sum > target:
                    right -= 1
                else:
                    left += 1
        
        return result