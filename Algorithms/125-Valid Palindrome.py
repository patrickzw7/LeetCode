class Solution(object):
    def isPalindrome(self, s):
        """
        :type s: str
        :rtype: bool
        """
        s = re.sub(r'[^A-Za-z0-9]', '', s).lower()
        left = 0
        right = len(s) - 1
        palin = True
        while left < right:
            if s[left] != s[right]:
                return False
            left += 1
            right -= 1
        return palin