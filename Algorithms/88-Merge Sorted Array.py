class Solution(object):
    def merge(self, nums1, m, nums2, n):
        """
        :type nums1: List[int]
        :type m: int
        :type nums2: List[int]
        :type n: int
        :rtype: None Do not return anything, modify nums1 in-place instead.
        """
        
        i = 0
        j = 0
        k = 0

        while j < n:
            insertion = nums2[j]
            if i < m and nums1[k] <= insertion:
                k += 1
                i += 1
            else:
                if nums1[k] > insertion:
                    nums1.insert(k, insertion)
                    nums1.pop(-1)
                else:
                    nums1.pop(-1)
                    nums1.insert(k, insertion)
                #nums1.pop(-1)
                k += 1
                j += 1