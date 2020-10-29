<?php namespace App\Controllers;

use App\Models\KomikModel;
use CodeIgniter\CodeIgniter;
use CodeIgniter\Debug\Exceptions;
use CodeIgniter\Validation\Rules;

class Komik extends BaseController
{
	protected $komikModel;
	public function __construct()
	{
		$this->komikModel = new KomikModel();
	}
	public function index()
	{	
		
        $data=[
			'title'=>'Daftar Komik',
			'komik'=> $this->komikModel->getKomik()
		];
		return view('komik/index',$data);
	}
	public function detail($slug){
		
        $data=[
			'title'=>'Daftar Komik',
			'komik'=> $this->komikModel->getKomik($slug)
		];
		if (empty($data['komik'])) {
			throw new \CodeIgniter\Exceptions\PageNotFoundException('Judul Komik '. $slug .' tidak ditemukan');
		}
		
		return view('komik/detail',$data);
	}
	public function create(){
		// session();
		$data=[
			'title'=>'Tambah data Komik',
			'validation'=> \Config\Services::validation()
		];
		return view('komik/create',$data);
	}
	public function save(){
		if(!$this->validate([
			'judul' => [
				'rules'=>'required|is_unique[komik.judul]',
				'errors'=>[
					'required'=>'{field} komik harus diisi',
					'is_unique'=>'{field} komik sudah terdaftar'
				]
				],
			'sampul'=>[
				'rules'=>'max_size[sampul,1024]|is_image[sampul]|mime_in[sampul,image/jpg,image/jpeg,image/png]',
				'errors'=>[
					'max_size'=>'size terlalu besar',
					'is_image'=>'yang anda pilih bukan gambar',
					'mime_in'=>'yang anda pilih bukan gambar'
				]
			]

		])){
			// $validation = \Config\Services::validation();
			// $data['validation'] = $validation;
			// return redirect()->to('/komik/create')->withInput()->with('validation',$validation);
		
			return redirect()->to('/komik/create')->withInput();
		}	
		$fileSampul= $this->request->getFile('sampul');
		if($fileSampul->getError()==4){
			$namaSampul='default.jpg';
		}else{
			$namaSampul = $fileSampul->getRandomName();
			$fileSampul->move('img',$namaSampul);
		}
		
		$slug = url_title($this->request->getVar('judul'), '-' ,true);
		$this->komikModel->save([
			'judul'=> $this->request->getVar('judul'),
			'slug'=> $slug,
			'penulis'=> $this->request->getVar('penulis'),
			'penerbit'=> $this->request->getVar('penerbit'),
			'sampul'=> $namaSampul
		]);
		session()->setFlashdata('pesan','data berhasil ditambahkan');
		return redirect()->to('/komik');
		
	}

	public function delete($id){
		
		$komik=$this->komikModel->find($id);
		if ($komik['sampul']!='default.jpg') {
			unlink('img/'.$komik['sampul']);
		}
		$this->komikModel->delete($id);
		session()->setFlashdata('pesan','data berhasil dihapus');
		return redirect()->to('/komik');
	}
	//--------------------------------------------------------------------
	public function edit($slug){
		$data=[
			'title'=>'Tambah Ubah Komik',
			'validation'=> \Config\Services::validation(),
			'komik'=> $this->komikModel->getKomik($slug)
		];
		return view('komik/edit',$data);
	}
	public function update($id){
		$komiklama = $this->komikModel->getKomik($this->request->getVar('slug'));
		if($komiklama['judul']== $this->request->getVar('judul')){
			$rule_judul= 'required';
		}else{
			$rule_judul= 'required|is_unique[komik.judul]';
		}
		if(!$this->validate([
			'judul' => [
				'rules'=>$rule_judul,
				'errors'=>[
					'required'=>'{field} komik harus diisi',
					'is_unique'=>'{field} komik sudah terdaftar'
				]
				],
			'sampul'=>[
				'rules'=>'max_size[sampul,1024]|is_image[sampul]|mime_in[sampul,image/jpg,image/jpeg,image/png]',
				'errors'=>[
					'max_size'=>'size terlalu besar',
					'is_image'=>'yang anda pilih bukan gambar',
					'mime_in'=>'yang anda pilih bukan gambar'
				]
			]

		])){
			
			return redirect()->to('/komik/edit/'.$this->request->getVar('slug'))->withInput();
		}
		$fileSampul = $this->request->getFile('sampul');
		if($fileSampul->getError()==4){
			$namaSampul = $this->request->getVar('sampulLama');
		}else{
			$namaSampul = $fileSampul->getRandomName();
			$fileSampul->move('img',$namaSampul);
			unlink('img/'.$this->request->getVar('sampulLama'));
		}

		$slug = url_title($this->request->getVar('judul'), '-' ,true);
		$this->komikModel->save([
			'id'=>$id,
			'judul'=> $this->request->getVar('judul'),
			'slug'=> $slug,
			'penulis'=> $this->request->getVar('penulis'),
			'penerbit'=> $this->request->getVar('penerbit'),
			'sampul'=> $namaSampul
		]);
		session()->setFlashdata('pesan','data berhasil diubah');
		return redirect()->to('/komik');
	}
}