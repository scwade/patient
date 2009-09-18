namespace :db do
  desc "Load reference data for validation"
  task(:load_reference_ethnicity => :environment) do
    ROOT_FILE = RAILS_ROOT + "/db/seed/reference_ethnicity.csv"
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
      if ReferenceEthnicity.delete_all
        puts "Reading file reference_ethnicity.csv"
      else
        puts "Delete all rows from reference_ethnicities table failed!"
        fin.close
        exit
      end
    
      # Read file
      count = total = 0
      while !fin.eof do
        line = fin.readline
        s = line.split(",")
    
        # load data
        if !ReferenceEthnicity.create( :description => s[0]) 
          puts "Error trying to load reference_ethnicities table!"
          fin.close
          exit
        end 
      end

      # Cleanup
      fin.close
    end
  end
end
