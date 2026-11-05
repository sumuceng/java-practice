public class MyList {

    private String[] data = new String[3];   // 容量：3
    private int size = 0;                    // 实际存了几个

    public void add(String s) {
        // 满了就扩容：建两倍大的新数组，复制旧数据，替换引用
        if (size == data.length) {
            String[] temp = new String[data.length * 2];
            for (int i = 0; i < data.length; i++) {
                temp[i] = data[i];
            }
            data = temp;
        }
        data[size] = s;
        size++;
    }

    public String get(int index) {
        return data[index];
    }

    public int size() {
        return size;
    }
}
