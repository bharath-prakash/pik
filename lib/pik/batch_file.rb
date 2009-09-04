
class BatchFile

  def self.open(file)
    bf = new(file, :open)
    yield bf if block_given?
    bf
  end

  attr_accessor :file_data, :file_name, :ruby_dir

  def initialize(file, mode=:new)
    @rubyw_exe = 'rubyw.exe'
    @ruby_exe  = 'ruby.exe'
    @file = Pathname.new(file)
    case mode
    when :open
      @file_data = File.read(@file).split("\n")
    when :new
      @file_data = [header]
    end
    yield self if block_given?
  end
  
  def path
    @file
  end

  def header
    string =  "@ECHO OFF\n\n" 
    string << "::  This batch file generated by Pik, the\n"
    string << "::  Ruby Manager for Windows\n"  
  end  
  
  def ftype(files={ 'rbfile' => @ruby_exe, 'rbwfile' => @rubyw_exe })
    files.sort.each do |filetype, open_with|
      @file_data <<   "FTYPE #{filetype}=#{open_with} \"%1\" %*\n"
    end
    self
  end

  def call(bat)
    @file_data << "CALL #{bat}\n"
    self
  end

  def set(items)
    items.each{|k,v|   @file_data << "SET #{k}=#{v}" }
    self
  end

  def echo(string)
    string = ' ' + string unless string == '.'
    @file_data << "ECHO#{string}"
    self
  end

  def remove_line(re)
    @file_data.reject!{ |i| i =~ re }
  end

  def to_s
    @file_data.join("\n")
  end

  def write
    File.open(@file, 'w+'){|f| f.puts self.to_s }
  end

end
