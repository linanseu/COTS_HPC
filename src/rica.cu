#include <rica.cuh>

RICA::RICA(int input_size, int num_cha,
           int num_fil, int filter_size, 
           int step_size, int block_size,
           int batch_size,
           int num_pro_x, int num_pro_y,
           int process_id){

    this->input_size    = input_size;
    this->num_cha       = num_cha;
    this->num_fil       = num_fil;
    this->filter_size   = filter_size;
    this->step_size     = step_size;
    this->block_size    = block_size;
    this->hidden_size   = ((input_size - filter_size) / step_size + 1) * block_size;
    this->batch_size    = batch_size;

    this->num_pro_x     = num_pro_x;
    this->num_pro_y     = num_pro_y;
    this->process_id    = process_id;
    this->x_idx         = process_id % num_pro_x;
    this->y_idx         = process_id / num_pro_x;
    sub_hidden_x_size   = hidden_size / num_pro_x;
    sub_hidden_y_size   = hidden_size / num_pro_y;
}

RICA::~RICA(){

}
