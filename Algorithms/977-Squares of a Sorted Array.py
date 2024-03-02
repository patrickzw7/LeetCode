class Solution(object):
    def sortedSquares(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        squares = [num ** 2 for num in nums]
        squares.sort()
        return squares