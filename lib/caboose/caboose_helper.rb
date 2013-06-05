
class CabooseHelper
  
  def initialize(app_path)
    @app_path = app_path
  end
  
  def init_all
    init_gem
    init_app_config    
    init_initializer
    init_routes
    init_assets
    init_tinymce
    init_session
    remove_public_index
  end
  
  def init_file(filename)
    gem_root = Gem::Specification.find_by_name('caboose-cms').gem_dir
    filename = File.join(@app_path, filename)  
    copy_from = File.join(gem_root,'lib','sample_files', Pathname.new(filename).basename)
    
    if (!File.exists?(filename))
      FileUtils.cp(copy_from, filename)
    end  
  end
  
  # Add the gem to the Gemfile
  def init_gem
    puts "Adding the caboose gem to the Gemfile... "
    filename = File.join(@app_path,'Gemfile')
    return if !File.exists?(filename)
    
    file = File.open(filename, 'rb')
    str = file.read
    file.close
    str2 = ""
    str.each_line do |line|
      if (!line.strip.start_with?('#') && (!line.index("gem 'caboose-cms'").nil? || !line.index('gem "caboose-cms"').nil?))
        str2 << "##{line}"
      else
        str2 << line
      end
    end
    str2 << "gem 'caboose-cms', '= #{Caboose::VERSION}'\n"
    File.open(filename, 'w') {|file| file.write(str2) }
  end
    
  # Require caboose in the application config
  def init_app_config
    puts "Requiring caboose in the application config..."
    
    filename = File.join(@app_path,'config','application.rb')
    return if !File.exists?(filename)    
          
    file = File.open(filename, 'rb')
    contents = file.read
    file.close    
    if (contents.index("require 'caboose'").nil?)
      arr = contents.split("require 'rails/all'", -1)
      str = arr[0] + "\nrequire 'rails/all'\nrequire 'caboose'\n" + arr[1]
      File.open(filename, 'w') { |file| file.write(str) }
    end
  end
  
  # Removes the public/index.html file from the rails app
  def remove_public_index
    puts "Removing the public/index.html file... "
    
    filename = File.join(@app_path,'public','index.html')
    return if !File.exists?(filename)
    File.delete(filename)
  end
  
  # Adds the caboose initializer file  
  def init_initializer
    puts "Adding the caboose initializer file..."
    
    filename = File.join(@app_path,'config','initializers','caboose.rb')
    return if File.exists?(filename)
    
    Caboose::salt = Digest::SHA1.hexdigest(DateTime.now.to_s)
    str = ""
    str << "# Salt to ensure passwords are encrypted securely\n"
    str << "Caboose::salt = '#{Caboose::salt}'\n\n"
    str << "# Where page asset files will be uploaded\n"
    str << "Caboose::assets_path = Rails.root.join('app', 'assets', 'caboose')\n\n"
    str << "# Register any caboose plugins\n"
    str << "#Caboose::plugins + ['MyCaboosePlugin']\n\n"
    
    File.open(filename, 'w') {|file| file.write(str) }
  end

  # Adds the routes to the host app to point everything to caboose
  def init_routes
    puts "Adding the caboose routes..."
    
    filename = File.join(@app_path,'config','routes.rb')
    return if !File.exists?(filename)
    
    str = "" 
    str << "\t# Catch everything with caboose\n"  
    str << "\tmount Caboose::Engine => '/'\n"
    str << "\tmatch '*path' => 'caboose/pages#show'\n"
    str << "\troot :to      => 'caboose/pages#show'\n"    
    file = File.open(filename, 'rb')
    contents = file.read
    file.close    
    if (contents.index(str).nil?)
      arr = contents.split('end', -1)
      str2 = arr[0] + "\n" + str + "\nend" + arr[1]
      File.open(filename, 'w') {|file| file.write(str2) }
    end    
  end
  
  def init_assets
    puts "Adding the layout files..."
    init_file('app/views/layouts/layout_default.html.erb')
  end
  
  def init_tinymce
    puts "Adding the tinymce config file..."
    init_file('config/tinymce.yml')
  end
  
  def init_session
    puts "Setting the session config..."    
    
    lines = []
    str = File.open(File.join(@app_path,'config','initializers','session_store.rb')).read 
    str.gsub!(/\r\n?/, "\n")
    str.each_line do |line|
      line = '#' + line if !line.index(':cookie_store').nil?        && !line.start_with?('#')
      line[0] = ''      if !line.index(':active_record_store').nil? && line.start_with?('#')
      lines << line.strip
    end
    str = lines.join("\n")
    File.open(File.join(@app_path,'config','initializers','session_store.rb'), 'w') {|file| file.write(str) }
  end
end