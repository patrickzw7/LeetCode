class Solution(object):
    def romanToInt(self, s):
        """
        :type s: str
        :rtype: int
        """
        results = 0
        for i in range(len(s)):
            bit = s[len(s) - i - 1]
            if bit == 'I':
                if results < 5:
                    results += 1
                else:
                    results -= 1
            elif bit == 'V':
                results += 5
            elif bit == 'X':
                if results < 50:
                    results += 10
                else:
                    results -= 10
            elif bit == 'L':
                results += 50
            elif bit == 'C':
                if results < 500:
                    results += 100
                else:
                    results -= 100
            elif bit == 'D':
                results += 500
            elif bit == 'M':
                results += 1000
            
        return results