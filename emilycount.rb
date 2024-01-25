# Read file and return at an array of lines
def getFileLines(name)
    fileObj = File.open(name)
    text = fileObj.read()
    text.split("/n")
end

# Display all the line in an array of text strings
def displayLines(lines)
    lines.each do |l|
      print l,"\n"
    end
end

# Create a table of words
def createWordCountTable(lines)
    table = {}
    lines.each do |l|
        line = l.split(" ")
        line.each do |w|
            # Remove punctuation, make lower case
            w=w.gsub(/\W/, ' ').downcase  
            # either make new entry, or increment entry
            if table.key?(w)
                table[w] = table[w]+1
            else 
                table[w] = 1
            end
        end
    end
    table
 end

def displayTableAlpha(table)
    table = Hash[table.sort_by { |key, value| key}]
    table.each do |key,word|
        print key,"->",word,"\n"
    end
end

def displayTableCount(table)
    table = Hash[table.sort_by { |key, value| value}]
    table.each do |key,word|
        print key,"->",word,"\n"
    end
end

def lookupWords(table)
    while true
        print "word to lookup:"
        w = gets.chomp
        if w.length<1
            break
        end
        if table.key?(w)
            print w," occurs ",table[w]," times.","\n"
        else 
            print w," not in text","\n"
        end 
    end 
end  

lines=getFileLines("emilydickenson.txt")
table=createWordCountTable(lines)
print "total uniqu words:",table.length,"\n"

lookupWords(table)

