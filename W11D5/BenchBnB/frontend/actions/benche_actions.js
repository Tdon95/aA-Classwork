import * as APIUtil from '../util/bench_api_util';
export const RECEIVE_BENCHES = 'RECEIVE_BENCHES';

export const receiveBenches = benches => ({
    type: RECEIVE_BENCHES,
    benches,
});

export const fetchBenches = ele => dispatch => (
    APIUtil.fetchBenches(ele).then(benches => (dispatch(receiveBenches(benches))
    ))
);