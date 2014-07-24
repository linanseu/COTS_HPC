class RICA {
    
    // model parameter
    int input_size;     /** input image size */
    int num_cha;        /** input channel number */
    int num_fil;        /** filter number */
    int filter_size;    /** filter size */
    int step_size;      /** input convolve step size */
    int block_size;     /** hidden layer block size (share input sub area) */
    int hidden_size;    /** hidden layer size = ((input_size - filter_size) / step_size + 1) * block_size */
    int batch_size;     /** image number in one batch */

    // distributed gpu parameter
    int process_id;             /** process id */
    int num_pro_x, num_pro_y;   /** process number on x and y direction */
    int x_idx;                  /** x direction index */
    int y_idx;                  /** y direction index */
    int sub_hidden_x_size;      /** hidden layer size on x direction for this process */
    int sub_hidden_y_size;      /** hidden layer size on y direction for this process */

    // host memory
    float *h_input_batch;   /** batch_size * num_cha * input_size * input_size */
    float *h_W;             /** num_fil * (sub_hidden_x_size/block_size) * (sub_hidden_y_size/block_size) * 
                                block_size * block_size * num_cha * filter_size * filter_size */
    float *h_H;             /** num_fil * hidden_size * hidden_size */ 
    float *h_R;             /** batch_size * num_cha * input_size * input_size */

    public:
        
        /**
         * @brief  set parameter, allocate memory
         *
         * @param input_size
         * @param num_cha
         * @param num_fil
         * @param filter_size
         * @param step_size
         * @param block_size
         * @param batch_size
         */
        RICA(int input_size, int num_cha,
             int num_fil, int filter_size, 
             int step_size, int block_size,
             int batch_size,
             int num_pro_x, int num_pro_y,
             int process_id);

        /**
         * @brief  free memory
         */
        ~RICA();
};
