class Solution(object):
    def reverseWords(self, s):
        """
        :type s: str
        :rtype: str
        """
        list_w = s.split(" ")
        list_r = ''
        for i in list_w[::-1]:
            if i != "":
                list_r += i + " "
        return list_r.strip()