# def first_anagram?(str1, str2)
#     # sub_anagram(str1).include?(str2)
#     str1.each_char do |char|
#         return false if !str2.include?(char)
#     end
#     true
# end
def first_anagram?(str1, str2)
    arr1 = str1.split("")
    perm1 = arr1.permutation.to_a
    # p perm1.length
    # perm1.in
    perm1.each do |word|
        sub = word.join("")
        if sub == str2
            return true
        end
    end

    false
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

 def first_anagram?(str1, str2)
    word1 = str1.split("")
    word2 = str2.split("")

    word1.each do |char|
        idx = word2.find_index(char)
        return false if !word2.include?(char)
        word2.delete_at(idx)
    end
    # p str1
    # p str2
    # p word2
    word2.empty?
end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true
