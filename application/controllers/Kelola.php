<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Kelola extends MY_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->cekAdmin();
    }

    public function index()
    {
        $kelola = $this->M_all->tampilKelola()->result_array();
        $data = [
            "kelola"               => $kelola,
            "title"                => 'Data masyarakat',
            "breadcumb"            => 'kelola',
            "content"              => 'kelola/index'
        ];
        $this->load->view('template/view', $data, FALSE);
    }

    public function hapus($id)
    {
        $where = [
            'id'    => $id
        ];
        $hapus = $this->M_all->hapus('tb_pengaduan', $where);
        if($hapus){
            echo "<script>";
            echo "alert('Data berhasil dihapus')";
            echo "</script>";
            redirect('admin/kelola','refresh');
        }else{
            echo "<script>";
            echo "alert('Data gagal dihapus')";
            echo "</script>";
            redirect('admin/kelola','refresh');
        }
    }

    public function balas($id)
    {
        $this->form_validation->set_rules('balasan', 'Balasan', 'required', ["required" => "%s tidak boleh kosong"]);
        $this->form_validation->set_rules('foto', 'Foto', 'required]', ['required' => '%s harus diisi']);
        
        
        if ($this->form_validation->run() == True) {

            $config['upload_path'] = './assets/gambar';
            $config['allowed_types'] = 'jpeg|jpg|png';
            $config['max_size']  = '1000';
            
            $this->load->library('upload', $config);

            
            if ( ! $this->upload->do_upload('foto')){
                $error = $this->upload->display_errors();
                echo $error;
            }

            else {
  
            $data = [
                'id_pengaduan'      => $id,
                'tgl_tanggapan'     => date('Y-m-d'),
                'tanggapan'         => htmlspecialchars($this->input->post('balasan')),
                'id_petugas'        => $this->session->userdata('admin')['session_id'],
                'foto'              => $this->upload->data()["file_name"]
            ];
            $tambah = $this->M_all->simpan('tb_tanggapan ', $data);
            if($tambah){
                $where = [
                    'id'    => $id
                ];
                $data = [
                    'status'    => 'ditanggapi'
                ];
                $ubah = $this->M_all->ubah('tb_pengaduan', $data, $where);
                echo "<script>";
                echo "alert('Berhasil Membuat Balasan')";
                echo "</script>";
                redirect('admin/kelola','refresh');
            }else{
                echo "<script>";
                echo "alert('Gagal Membuat Balasan')";
                echo "</script>";
                redirect('admin/kelola','refresh');
            }
        } 

    }
        
        else {
            $id_pengaduan = $id;
            $where = $id_pengaduan;
            $data_pengaduan = $this->M_all->tampilPengaduanSatu($where)->row();
            $data = [
                "pengaduan"            => $data_pengaduan,
                "title"                => 'Data masyarakat',
                "breadcumb"            => 'kelola',
                "content"              => 'kelola/balas'
            ];
            $this->load->view('template/view', $data, FALSE);
        }
    }

    public function selesai($id)
    {
        $where = [
            'id'    => $id
        ];
        $data = [
            'status'    => 'selesai'
        ];
        $ubah = $this->M_all->ubah('tb_pengaduan ', $data, $where);
        if($ubah){
            echo "<script>";
            echo "alert('Pengaduan Berhasil diselesaikan')";
            echo "</script>";
            redirect('admin/kelola','refresh');
        }else{
            echo "<script>";
            echo "alert('Pengaduan Gagal diselesaikan')";
            echo "</script>";
            redirect('admin/kelola','refresh');
        }
    }


}

/* End of file Kelola.php */
