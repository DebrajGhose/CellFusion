
saveplace = "Z:/Users/Rossie/Microscopy/2017_12_04_rcc104_PSR1-GFP_mCh/rcc104_altered_images/rcc104_analyses";
reltime = 0;
for(t = 47; t<=57 ; t++){
zpos = 8;
reltime=reltime+1;

Stack.setPosition(1,zpos,t);

run("Clear Results");
profile = getProfile();

for (i=0; i<profile.length; i++)
  setResult("Value", i, profile[i]);
  
updateResults();

filename = "Values" +  reltime + ".txt";

savename = saveplace+filename;

saveAs("Measurements", savename);


}



