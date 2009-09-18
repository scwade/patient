namespace :db do
  desc "Load reference data for validation"
  task(:load_reference_filter_state => :environment) do
    ROOT_FILE = RAILS_ROOT + "/db/seed/reference_filter_state.csv"
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
      if ReferenceFilterState.delete_all
        puts "Reading file reference_filter_state.csv"
      else
        puts "Delete all rows from reference_filter_states table failed!"
        fin.close
        exit
      end
    
      # Read file
      count = total = 0
      while !fin.eof do
        line = fin.readline
        s = line.split(",")
    
        # load data
        if !ReferenceFilterState.create( :state => s[0], :description => s[1]) 
          puts "Error trying to load reference_filter_states table!"
          fin.close
          exit
        end 
      end

      # Cleanup
      fin.close
    end
  end
end
