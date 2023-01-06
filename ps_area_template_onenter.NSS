void main() {

 	object oPC = GetEnteringObject();
	string lockVariable = "TEMPLATE_LOCK"; //change this to something unique for this area
	
	//declaring some variables for tidyness
	string sNPCTag;
	string sWPTag;
	object oWP;
	
 	int iLock = GetGlobalInt(lockVariable);
 	if ( iLock == 0 )
 	{
  		SetGlobalInt(lockVariable, 1); // Makes sure the script doesn't retrigger while still running
  
		//*******************************************************
		//Spawn an NPC
		sNPCTag = "ps_npc_custom"; //the resref of the creature to spawn
		sWPTag = "wp_ooc_tailor"; //the tag of the waypoint where the creature should spawn
  		if(GetObjectByTag(sNPCTag) == OBJECT_INVALID) {
		
   			oWP = GetWaypointByTag(sWPTag);
   			CreateObject(OBJECT_TYPE_CREATURE, sNPCTag, GetLocation(oWP));   
			 
  		}
		//*******************************************************
    
  		SetGlobalInt(lockVariable, 0); //release area for future spawning
 	}
}