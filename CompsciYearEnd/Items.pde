class Items
{
 float boost;

   Items (float b)
   {
    boost=b;
   }
   
   //strength boost
   Items (Entity[] player)
   {
    boost=(player.attack)*(0.15);
   }
   
   //defence boost
      Items (Entity[] player)
   {
    boost=(player.defence)*(0.15);
   }
   
   //spped
      Items (Entity[] player)
   {
    boost=(player.speed)*(0.15);
   }
   
   
   // only including the 4 different potions, change the array size when adding more item types
   Items[] itemEffects = new Items[4];
  {
   //health
   itemEffects[0] = new Items(20);
   //strength
   itemEffects[1] = new Items(characterStats[0]);
   //defence
   itemEffects[2] = new Items(characterStats[0]);
   //speed
   itemEffects[3] = new Items(characterStats[0]);
  }

}