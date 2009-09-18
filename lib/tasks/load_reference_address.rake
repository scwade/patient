namespace :db do
  desc "Load reference data for validation"
  task(:load_reference_address => :environment) do
    ROOT_FILE = RAILS_ROOT + "/db/seed/reference_address.csv"
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
      if ReferenceAddress.delete_all
        puts "Reading file reference_address.csv"
      else
        puts "Delete all rows from reference_addresses table failed!"
        fin.close
        exit
      end
    
      # Read file
      count = total = 0
      while !fin.eof do
        line = fin.readline
        s = line.split(",")
    
        # load data
        if !ReferenceAddress.create( :state => s[1], :zip5_code=> s[0] ) 
          puts "Error trying to load reference_addresses table!"
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
