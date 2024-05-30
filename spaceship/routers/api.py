from fastapi import APIRouter
import numpy as np

router = APIRouter()


@router.get('')
def hello_world() -> dict:
    return {'msg': 'Hello, World!'}


@router.get('/multiply_matrices')
def multiply_matrices() -> dict:
    matrix_a = np.random.randint(0, 10, (10, 10)).tolist()
    matrix_b = np.random.randint(0, 10, (10, 10)).tolist()

    matrix_a_np = np.array(matrix_a)
    matrix_b_np = np.array(matrix_b)

    product_np = np.matmul(matrix_a_np, matrix_b_np)

    product = product_np.tolist()

    return {
        'matrix_a': matrix_a,
        'matrix_b': matrix_b,
        'product': product
    }
