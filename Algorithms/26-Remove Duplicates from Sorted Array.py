class Solution(object):
    def removeDuplicates(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        left, right = 0, 1

        while right < len(nums):
            if nums[right] == nums[right - 1]:
                right += 1
            else:
                nums[left + 1] = nums[right]
                left += 1
                right += 1

        return left + 1