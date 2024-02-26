class Solution(object):
    def generateParenthesis(self, n):
        """
        :type n: int
        :rtype: List[str]
        """
        res = []

        def deter(left, right, s):
            if len(s) == 2 * n:
                res.append(s)
                return 
            else:
                if left < n:
                    deter(left + 1, right, s + "(")
                if left > right:
                    deter(left, right + 1, s + ")")

        deter(0, 0, "")
        return res
