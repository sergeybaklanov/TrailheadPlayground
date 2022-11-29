public class StringArrayTest {
    public static String[] generateStringArray(Integer n){
        String [] listStrings = new String[n];
        for(Integer i =0; i<n;i++){
            listStrings[i]='Test '+i;
        }
        return listStrings;
    }
}