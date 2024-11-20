class LongLists {
    private static class Node {
	int data;
	Node next;
	Node(int d, Node n) { data = d; next = n; }
    }

    static Node range(int lo, int hi) {
	Node l = null;
	while (lo < hi) {
	    l = new Node(hi-1,l);
	    --hi;
	}
	return l;
    }

    private static final int MAXLEN = 10;
    
    static String toString(Node l) {
	StringBuilder sb = new StringBuilder();
	sb.append("[");
	int count = 0;
	while (l != null) {
	    if (count >= MAXLEN) {
		sb.append("|...");
		break;
	    }
	    if (count > 0) sb.append(", ");
	    sb.append(l.data);
	    l = l.next;
	    ++count;
	}
	sb.append("]");
	return sb.toString();
    }

    static int recursiveLength(Node l) {
	if (l == null) return 0;
	else return recursiveLength(l.next) + 1;
    }

    static int tailRecursiveLength(Node l, int n) {
	if (l == null) return n;
	else return tailRecursiveLength(l.next, n+1);
    }
    
    public static void main(String[] args) {
	int n = 1000;
	for (String s : args) {
	    switch(s) {
	    case "--sample":
		System.out.println("range(1,5) = " + toString(range(1,5)));
		System.out.println("range(1," + n + ") = " + toString(range(1,n)));
		break;
	    case "--more":
		n *= 10;
		break;
	    case "--length":
		{
		    Node list = range(1,n);
		    System.out.print("recursiveLength(range(1,"+n+")) = ");
		    System.out.println(recursiveLength(list));
		}
		break;
	    case "--tailLength":
		{
		    Node list = range(1,n);
		    System.out.print("tailRecursiveLength(range(1,"+n+")) = ");
		    System.out.println(tailRecursiveLength(list,0));
		}
		break;
	    }
	}
    }
}	
	
