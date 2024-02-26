class Solution(object):
    def reverse(self, x):
        """
        :type x: int
        :rtype: int
        """
        digits = []

        if x == abs(x):
            abso = 1
        else:
            abso = -1
            x = -x

        result = 0

        while(x > 0):
            result = result * 10 + x % 10
            x //= 10

        
        result = abso * result
        if result > 2 ** 31 - 1 or result < -2 ** 31:
            return 0

        return result