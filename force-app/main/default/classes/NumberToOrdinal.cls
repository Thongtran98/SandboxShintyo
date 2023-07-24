public with sharing class NumberToOrdinal {
    private static Map<String,String> ordinalMap = new Map<String,String>();
    static {
        ordinalMap.put('one', 'first');
        ordinalMap.put('two', 'second');
        ordinalMap.put('three', 'third');
        ordinalMap.put('five', 'fifth');
        ordinalMap.put('eight', 'eighth');
        ordinalMap.put('nine', 'ninth');
        ordinalMap.put('twelve', 'twelfth');
    }
    
    public static String toOrdinal(Integer n) {
        String spelling = numToString(n);
        List<String> split = spelling.split(' ');
        String last = split[split.size() - 1];
        String replace = '';
        if ( last.contains('-') ) {
            String[] lastSplit = last.split('-');
            String lastWithDash = lastSplit[1];
            String lastReplace = '';
            if ( ordinalMap.containsKey(lastWithDash) ) {
                lastReplace = ordinalMap.get(lastWithDash);
            }
            else if ( lastWithDash.endsWith('y') ) {
                lastReplace = lastWithDash.substring(0, lastWithDash.length() - 1) + 'ieth';
            }
            else {
                lastReplace = lastWithDash + 'th';
            }
            replace = lastSplit[0] + '-' + lastReplace;
        }
        else {
            if ( ordinalMap.containsKey(last) ) {
                replace = ordinalMap.get(last);
            }
            else if ( last.endsWith('y') ) {
                replace = last.substring(0, last.length() - 1) + 'ieth';
            }
            else {
                replace = last + 'th';
            }
        }
        split[split.size() - 1] = replace;
        return String.join(split,' ');
    }

    private static final String[] nums = new String[] {
            'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 
            'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'
    };
    
    private static final String[] tens = new String[] {'zero', 'ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'};

    private static String numToString(Integer n) {
        return numToStringHelper(n);
    }
    
    private static String numToStringHelper(Integer n) {
        
        if ( n < 0 ) {
            return 'negative ' + numToStringHelper(-n);
        }
        Integer index = (Integer) n;
        if ( n <= 19 ) {
            return nums[index];
        }
        if ( n <= 99 ) {
            return tens[index/10] + (math.mod(n,10) > 0 ? '-' + numToStringHelper(math.mod(n,10)) : '');
        }
        
        String label = null;
        // Integer factor = 1;
        if ( n <= 999 ) {
            label = 'hundred';
            // factor = 100;
        }
        // else if ( n <= 999999) {
        //     label = 'thousand';
        //     factor = 1000;
        // }
        // else if ( n <= 999999999) {
        //     label = 'million';
        //     factor = 1000000;
        // }
        // else if ( n <= 999999999999L) {
        //     label = 'billion';
        //     factor = 1000000000;
        // }
        // else if ( n <= 999999999999999L) {
        //     label = 'trillion';
        //     factor = 1000000000000L;
        // }
        // else if ( n <= 999999999999999999L) {
        //     label = 'quadrillion';
        //     factor = 1000000000000000L;
        // }
        // else {
        //     label = 'quintillion';
        //     factor = 1000000000000000000L;
        // }
        
            return numToStringHelper(n / 100) + ' ' + label + (math.mod(n,100) > 0 ? ' ' + numToStringHelper(math.mod(n,100)) : '');
    
        
        // return numToStringHelper((n / factor) :'')  + ' ' + label + math.mod(n,factor) > 0 ? ' ' + numToStringHelper (math.mod(n,factor)) : '');
    }
}