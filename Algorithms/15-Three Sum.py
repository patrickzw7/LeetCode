class Solution(object):
    def threeSum(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        output = []

        nums.sort()

        for i in range(0, len(nums) - 2):
            left = i + 1
            right = len(nums) - 1
            if i > 0 and nums[i] == nums[i - 1]:
                continue
            while left < right:
                sumnums = nums[i] + nums[left] + nums[right]
                if sumnums == 0:
                    output.append([nums[i], nums[left], nums[right]])
                    while left < right and nums[left] == nums[left + 1]:
                        left += 1
                    left += 1
                    right -= 1
                elif sumnums > 0:
                    right -= 1
                else:
                    left += 1

        #output = [list(t) for t in set(tuple(l) for l in output)]
        return output