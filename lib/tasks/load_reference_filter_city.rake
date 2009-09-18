namespace :db do
  desc "Load reference city data for validation"
  task(:load_reference_filter_city => :environment) do
    ROOT_FILE = RAILS_ROOT + "/db/seed/reference_filter_city.csv"
    begin
      if !File.exists?(ROOT_FILE)
        puts "File: " + ROOT_FILE.to_s + "  not found!"
        exit
      end
      
      # Open file
      if !(fin  = File.open(ROOT_FILE, "r"))
        puts "File: " + ROOT_FILE.to_s + " failed to open for reading!"
        exit
      else
        fin.rewind
      end
      
      # Clear table 
      if ReferenceFilterCity.delete_all
        puts "Reading file reference_filter_city.csv"
      else
        puts "Delete all rows from reference_cities table failed!"
        fin.close
        exit
      end
    
      # Read file
      count = total = 0
      while !fin.eof do
        line = fin.readline
        s = line.split(",")
    
        # load data
        if !ReferenceFilterCity.create( :description => s[0]) 
          puts "Error trying to load reference_cities table!"
          fin.close
          exit
        elsif count == 1000
          $stdout << "."
          $stdout.flush
          count = 0
        else
          count += 1
        end
        total += 1
      end

      # Cleanup
      fin.close
      $stdout << "\nAll done!, " << total << " records added to reference_addresses table.\n"
      $stdout.flush
    end
  end
end
